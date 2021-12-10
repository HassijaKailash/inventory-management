using Dapper;
using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Text;
using System.Threading.Tasks;

namespace Inventory.Repository
{
    public class InventoryRepository : IInventoryRepository
    {
        private readonly IConfiguration _configuration;
        public InventoryRepository(IConfiguration configuration)
        {
            _configuration = configuration;
        }
        public async Task<int> Add(InventoryMaster entity)
        {
            int identity =0;
            using (var connection = new SqlConnection(_configuration.GetConnectionString("Default")))
            {
                DynamicParameters ObjParm = new DynamicParameters();
                ObjParm.Add("@Name", entity.Description);
                ObjParm.Add("@Description", entity.Name);
                ObjParm.Add("@Price", entity.Price);
                ObjParm.Add("@Quantity", entity.Quantity);

                identity = await connection.ExecuteScalarAsync<int>("sp_InventoryMaster_Insert", ObjParm, commandType: CommandType.StoredProcedure);

            }
            return identity;
        }

        public async Task<int> Delete(int id)
        {

            using (var connection = new SqlConnection(_configuration.GetConnectionString("Default")))
            {
                DynamicParameters ObjParm = new DynamicParameters();
                ObjParm.Add("@Id", id);
                return await connection.ExecuteAsync("sp_InventoryMaster_Delete", ObjParm, commandType: CommandType.StoredProcedure);
            }
        }

        public async Task<List<InventoryMaster>> GetAll()
        {
            using (var connection = new SqlConnection(_configuration.GetConnectionString("Default")))
            {

                var a = await connection.QueryAsync<InventoryMaster>("sp_InventoryMaster_GetAll", commandType: CommandType.StoredProcedure);
               return a.AsList<InventoryMaster>();
            }
        }

        public async Task<InventoryMaster> GetById(int id)
        {

            using (var connection = new SqlConnection(_configuration.GetConnectionString("Default")))
            {
                DynamicParameters ObjParm = new DynamicParameters();
                ObjParm.Add("@Id", id);
                return await connection.QueryFirstAsync<InventoryMaster>("sp_InventoryMaster_GetById", ObjParm, commandType: CommandType.StoredProcedure);
                
            }
        }

        public async Task<int> Update(InventoryMaster entity)
        {
            

            using (var connection = new SqlConnection(_configuration.GetConnectionString("Default")))
            {
                DynamicParameters ObjParm = new DynamicParameters();
                ObjParm.Add("@Id", entity.Id);
                ObjParm.Add("@Name", entity.Description);
                ObjParm.Add("@Description", entity.Name);
                ObjParm.Add("@Price", entity.Price);
                ObjParm.Add("@Quantity", entity.Quantity);
                return await connection.ExecuteAsync("sp_InventoryMaster_Update", ObjParm, commandType: CommandType.StoredProcedure);
             
            }
        }
    }
}

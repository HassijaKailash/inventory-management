using Inventory.Model;
using Inventory.Repository;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace Inventory.Service
{
    public class InventoryService : IInventoryService
    {
        private readonly IInventoryRepository _inventoryRepository;
        public InventoryService(IInventoryRepository inventoryRepository)
        {
            _inventoryRepository = inventoryRepository;
        }
        public async Task<int> Add(InventoryInputModel inventoryInputModel)
        {
            InventoryMaster inventoryMaster = new InventoryMaster
            {
                Description = inventoryInputModel.Description,
                Name = inventoryInputModel.Name,
                Price = inventoryInputModel.Price,
                Quantity = inventoryInputModel.Quantity
            };
 
           return await _inventoryRepository.Add(inventoryMaster);
        }

        public async Task<int> Delete(int Id)
        {
            return await _inventoryRepository.Delete(Id);
        }

        public async Task<List<InventoryOutputModel>> GetAll()
        {
            List<InventoryMaster> inventoryMasters = await _inventoryRepository.GetAll();
            List<InventoryOutputModel> lstOutput = new List<InventoryOutputModel>();
            inventoryMasters.ForEach(x => lstOutput.Add(new InventoryOutputModel { Id = x.Id, CreatedAt = x.CreatedAt, Description = x.Description, Name = x.Name, Price = x.Price, Quantity = x.Quantity }));

            return lstOutput;
        }

        public async Task<InventoryOutputModel> GetById(int Id)
        {
            InventoryMaster inventoryMaster = await _inventoryRepository.GetById(Id);
            return new InventoryOutputModel { Id = inventoryMaster.Id, Description = inventoryMaster.Description, Name = inventoryMaster.Name, Price = inventoryMaster.Price, Quantity = inventoryMaster.Quantity, CreatedAt = inventoryMaster.CreatedAt };

        }

        public async Task<int> Update(InventoryInputModel inventoryInputModel)
        {
            InventoryMaster inventoryMaster = new InventoryMaster
            {
                Description = inventoryInputModel.Description,
                Id = (int)inventoryInputModel.Id,
                Name = inventoryInputModel.Name,
                Price = inventoryInputModel.Price,
                Quantity = inventoryInputModel.Quantity
            };
            return await _inventoryRepository.Update(inventoryMaster);
        }

    }
}

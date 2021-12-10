using Inventory.Model;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace Inventory.Service
{
    public interface IInventoryService
    {
        Task<int> Add(InventoryInputModel inventoryInputModel);
        Task<int> Delete(int Id);
        Task<int> Update(InventoryInputModel inventoryInputModel);
        Task<List<InventoryOutputModel>> GetAll();
        Task<InventoryOutputModel> GetById(int Id);
    }
}

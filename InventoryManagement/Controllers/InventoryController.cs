using Inventory.Model;
using Inventory.Service;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace InventoryManagement.Controllers
{
    [ApiController]
    [Route("[controller]")]
    //need to add token based authentication
    public class InventoryController : ControllerBase
    {
       
        private readonly ILogger<InventoryController> _logger;
        private readonly IInventoryService _inventoryService;

        public InventoryController(ILogger<InventoryController> logger, IInventoryService inventoryService)
        {
            _logger = logger;
            _inventoryService = inventoryService;
        }


        [HttpPost]
        public async Task<IActionResult> Add(InventoryInputModel inventoryInputModel)
        {
            try
            {
                var data = await _inventoryService.Add(inventoryInputModel);
                return Ok(data);
            }
            catch (Exception ex)
            {
                _logger.LogError(ex.InnerException.ToString());
                return null;
            }
         
        }
        [HttpGet]
        public async Task<IActionResult> GetAll()
        {
            try
            {
                var data = await _inventoryService.GetAll();
                return Ok(data);
            }
            catch (Exception ex)
            {
                _logger.LogError(ex.InnerException.ToString());
                 return null;
            }
        }

        [HttpGet("{id}")]
        public async Task<IActionResult> GetById(int id)
        {
            try
            {
            var data = await _inventoryService.GetById(id);
            if (data == null) return Ok();
            return Ok(data);
            }
            catch (Exception ex)
            {
                _logger.LogError(ex.InnerException.ToString());
                return null;
            }   
            
        }

        [HttpDelete]
        public async Task<IActionResult> Delete(int id)
        {
            try
            {
                var data = await _inventoryService.Delete(id);
                return Ok(data);
            }
            catch (Exception ex)
            {

                _logger.LogError(ex.InnerException.ToString());
                return null;
            }
           
        }
        [HttpPut]
        public async Task<IActionResult> Update(InventoryInputModel inventoryInputModel)
        {
            try
            {
                var data = await _inventoryService.Update(inventoryInputModel);
                return Ok(data);
            }
            catch (Exception ex)
            {
                _logger.LogError(ex.InnerException.ToString());
                return null; 
            }
           
        }

    }
}

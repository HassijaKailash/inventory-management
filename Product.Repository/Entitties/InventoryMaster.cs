using System;
using System.Collections.Generic;
using System.Text;

namespace Inventory.Repository
{
    public class InventoryMaster
    {
        public int Id { get; set; }

        public string Name { get; set; }

        public string Description { get; set; }

        public decimal Price { get; set; }

        public int Quantity { get; set; }
        public DateTime CreatedAt { get; set; }
    }
}

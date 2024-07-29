using System;
using System.Collections.Generic;

namespace ShoppingWebApp.Models;

public partial class ShoppingList:Common
{
    public int Id { get; set; }

    public int? BuyerId { get; set; }

    public double? SubTotal { get; set; }

    public double? Discount { get; set; }

    public double? GrandTotal { get; set; }
    public List<ShoppingListItem> Items { get; set; }
}

using System;
using System.Collections.Generic;

namespace ShoppingWebApp.Models;

public partial class ShoppingListItem:Common
{
    public int Id { get; set; }

    public int? ShoppingListId { get; set; }

    public string? ProductName { get; set; }

    public int? Quantity { get; set; }

    public double? Price { get; set; }

}

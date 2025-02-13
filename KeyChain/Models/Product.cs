using System;
using System.Collections.Generic;

namespace KeyChain.Models;

public partial class Product
{
    public string ProductCode { get; set; } = null!;

    public string? Image { get; set; }

    public string? Answer { get; set; }

    public bool? MainPage { get; set; }
}

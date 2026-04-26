using System;
using System.Collections.Generic;

namespace Furever_Homes.Models;

public partial class AnimalPhoto
{
    public int PhotoId { get; set; }

    public int AnimalId { get; set; }

    public string PhotoUrl { get; set; } = null!;

    public string? Caption { get; set; }

    public bool IsPrimary { get; set; }

    public virtual Animal Animal { get; set; } = null!;
}

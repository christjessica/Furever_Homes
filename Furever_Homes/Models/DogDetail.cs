using System;
using System.Collections.Generic;

namespace Furever_Homes.Models;

public partial class DogDetail
{
    public int AnimalId { get; set; }

    public bool? HouseTrained { get; set; }

    public bool? Heartworm { get; set; }

    public string? DogCoat { get; set; }

    public virtual Animal Animal { get; set; } = null!;
}

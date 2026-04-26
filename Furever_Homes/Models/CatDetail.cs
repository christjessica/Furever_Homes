using System;
using System.Collections.Generic;

namespace Furever_Homes.Models;

public partial class CatDetail
{
    public int AnimalId { get; set; }

    public bool? Fivpositive { get; set; }

    public bool? LitterTrained { get; set; }

    public bool? Declawed { get; set; }

    public string? CatCoat { get; set; }

    public virtual Animal Animal { get; set; } = null!;
}

using System;
using System.Collections.Generic;

namespace Furever_Homes.Models;

public partial class Adoption
{
    public int AdoptionId { get; set; }

    public int ApplicationId { get; set; }

    public DateTime AdoptionDate { get; set; }

    public decimal? AdoptionFee { get; set; }

    public virtual AdoptionApplication Application { get; set; } = null!;
}

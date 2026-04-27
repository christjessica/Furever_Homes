using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace Furever_Homes.Migrations
{
    /// <inheritdoc />
    public partial class AddCoatCheckConstraints : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddCheckConstraint(
                name: "CK_DogDetail_DogCoat",
                table: "DogDetail",
                sql: "[DogCoat] IN ('Short', 'Medium', 'Long', 'Wire', 'Curly', 'Hairless', 'Double')");

            migrationBuilder.AddCheckConstraint(
                name: "CK_CatDetail_CatCoat",
                table: "CatDetail",
                sql: "[CatCoat] IN ('Short Hair', 'Medium Hair', 'Long Hair', 'Hairless')");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropCheckConstraint(
                name: "CK_DogDetail_DogCoat",
                table: "DogDetail");

            migrationBuilder.DropCheckConstraint(
                name: "CK_CatDetail_CatCoat",
                table: "CatDetail");
        }
    }
}

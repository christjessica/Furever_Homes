using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace Furever_Homes.Migrations
{
    /// <inheritdoc />
    public partial class MakeBreedIdNotNull : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {

            migrationBuilder.Sql(@"
IF NOT EXISTS (
    SELECT 1 
    FROM sys.indexes 
    WHERE name = N'IX_Animal_BreedID'
    AND object_id = OBJECT_ID(N'[Animal]')
)
CREATE INDEX [IX_Animal_BreedID] ON [Animal] ([BreedID]);
");

            migrationBuilder.DropForeignKey(
                name: "FK_Animal_Breed",
                table: "Animal");

            migrationBuilder.AlterColumn<int>(
                name: "BreedID",
                table: "Animal",
                type: "int",
                nullable: false,
                oldClrType: typeof(int),
                oldType: "int",
                oldNullable: true);

            migrationBuilder.AddForeignKey(
                name: "FK_Animal_Breed",
                table: "Animal",
                column: "BreedID",
                principalTable: "Breed",
                principalColumn: "BreedID",
                onDelete: ReferentialAction.Cascade);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Animal_Breed",
                table: "Animal");

            migrationBuilder.AlterColumn<int>(
                name: "BreedID",
                table: "Animal",
                type: "int",
                nullable: true,
                oldClrType: typeof(int),
                oldType: "int");

            migrationBuilder.AddForeignKey(
                name: "FK_Animal_Breed",
                table: "Animal",
                column: "BreedID",
                principalTable: "Breed",
                principalColumn: "BreedID");
        }
    }
}

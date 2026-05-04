using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace Furever_Homes.Migrations
{
    /// <inheritdoc />
    public partial class AddSavedAnimalsToContext : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropIndex(
                name: "IX_SavedAnimal_AdopterId",
                table: "SavedAnimal");

            migrationBuilder.CreateIndex(
                name: "IX_SavedAnimal_AdopterId_AnimalId",
                table: "SavedAnimal",
                columns: new[] { "AdopterId", "AnimalId" },
                unique: true);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropIndex(
                name: "IX_SavedAnimal_AdopterId_AnimalId",
                table: "SavedAnimal");

            migrationBuilder.CreateIndex(
                name: "IX_SavedAnimal_AdopterId",
                table: "SavedAnimal",
                column: "AdopterId");
        }
    }
}

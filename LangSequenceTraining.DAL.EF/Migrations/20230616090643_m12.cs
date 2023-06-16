using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace LangSequenceTraining.Migrations
{
    /// <inheritdoc />
    public partial class m12 : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateIndex(
                name: "IX_Sequences_Text",
                table: "Sequences",
                column: "Text",
                unique: true);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropIndex(
                name: "IX_Sequences_Text",
                table: "Sequences");
        }
    }
}

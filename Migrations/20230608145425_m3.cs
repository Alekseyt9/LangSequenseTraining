using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace LangSequenceTraining.Migrations
{
    /// <inheritdoc />
    public partial class m3 : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<Guid>(
                name: "SequenceGroupId",
                table: "Sequences",
                type: "uuid",
                nullable: false,
                defaultValue: new Guid("00000000-0000-0000-0000-000000000000"));

            migrationBuilder.CreateIndex(
                name: "IX_Sequences_SequenceGroupId",
                table: "Sequences",
                column: "SequenceGroupId");

            migrationBuilder.AddForeignKey(
                name: "FK_Sequences_SequenceGroup_SequenceGroupId",
                table: "Sequences",
                column: "SequenceGroupId",
                principalTable: "SequenceGroup",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Sequences_SequenceGroup_SequenceGroupId",
                table: "Sequences");

            migrationBuilder.DropIndex(
                name: "IX_Sequences_SequenceGroupId",
                table: "Sequences");

            migrationBuilder.DropColumn(
                name: "SequenceGroupId",
                table: "Sequences");
        }
    }
}

/*
  Warnings:

  - You are about to drop the column `partnerId` on the `addresses` table. All the data in the column will be lost.
  - You are about to drop the column `partnerId` on the `coverage_areas` table. All the data in the column will be lost.
  - A unique constraint covering the columns `[document]` on the table `partners` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `id_partner` to the `addresses` table without a default value. This is not possible if the table is not empty.
  - Changed the type of `coordinates` on the `addresses` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.
  - Added the required column `id_partner` to the `coverage_areas` table without a default value. This is not possible if the table is not empty.
  - Changed the type of `coordinates` on the `coverage_areas` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.

*/
-- DropForeignKey
ALTER TABLE "addresses" DROP CONSTRAINT "addresses_id_fkey";

-- DropForeignKey
ALTER TABLE "coverage_areas" DROP CONSTRAINT "coverage_areas_id_fkey";

-- DropIndex
DROP INDEX "addresses_partnerId_key";

-- DropIndex
DROP INDEX "coverage_areas_partnerId_key";

-- DropIndex
DROP INDEX "partners_id_key";

-- AlterTable
ALTER TABLE "addresses" DROP COLUMN "partnerId",
ADD COLUMN     "id_partner" TEXT NOT NULL,
DROP COLUMN "coordinates",
ADD COLUMN     "coordinates" JSONB NOT NULL;

-- AlterTable
ALTER TABLE "coverage_areas" DROP COLUMN "partnerId",
ADD COLUMN     "id_partner" TEXT NOT NULL,
DROP COLUMN "coordinates",
ADD COLUMN     "coordinates" JSONB NOT NULL;

-- CreateTable
CREATE TABLE "pdvs" (
    "id" TEXT NOT NULL,
    "id_partner" TEXT NOT NULL,
    "id_address" TEXT NOT NULL,
    "id_coverage" TEXT NOT NULL,

    CONSTRAINT "pdvs_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "partners_document_key" ON "partners"("document");

-- AddForeignKey
ALTER TABLE "addresses" ADD CONSTRAINT "addresses_id_partner_fkey" FOREIGN KEY ("id_partner") REFERENCES "partners"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "coverage_areas" ADD CONSTRAINT "coverage_areas_id_partner_fkey" FOREIGN KEY ("id_partner") REFERENCES "partners"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "pdvs" ADD CONSTRAINT "pdvs_id_partner_fkey" FOREIGN KEY ("id_partner") REFERENCES "partners"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "pdvs" ADD CONSTRAINT "pdvs_id_address_fkey" FOREIGN KEY ("id_address") REFERENCES "addresses"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "pdvs" ADD CONSTRAINT "pdvs_id_coverage_fkey" FOREIGN KEY ("id_coverage") REFERENCES "coverage_areas"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

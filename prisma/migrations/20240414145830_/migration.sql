-- CreateTable
CREATE TABLE "partners" (
    "id" TEXT NOT NULL,
    "tradingName" TEXT NOT NULL,
    "ownerName" TEXT NOT NULL,
    "document" TEXT NOT NULL,

    CONSTRAINT "partners_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "addresses" (
    "id" TEXT NOT NULL,
    "partnerId" TEXT NOT NULL,
    "type" TEXT NOT NULL,
    "coordinates" INTEGER[],

    CONSTRAINT "addresses_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "coverage_areas" (
    "id" TEXT NOT NULL,
    "partnerId" TEXT NOT NULL,
    "type" TEXT NOT NULL,
    "coordinates" INTEGER[],

    CONSTRAINT "coverage_areas_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "partners_id_key" ON "partners"("id");

-- CreateIndex
CREATE UNIQUE INDEX "addresses_partnerId_key" ON "addresses"("partnerId");

-- CreateIndex
CREATE UNIQUE INDEX "coverage_areas_partnerId_key" ON "coverage_areas"("partnerId");

-- AddForeignKey
ALTER TABLE "addresses" ADD CONSTRAINT "addresses_id_fkey" FOREIGN KEY ("id") REFERENCES "partners"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "coverage_areas" ADD CONSTRAINT "coverage_areas_id_fkey" FOREIGN KEY ("id") REFERENCES "partners"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

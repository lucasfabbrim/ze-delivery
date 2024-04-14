-- CreateTable
CREATE TABLE "partners" (
    "id" TEXT NOT NULL,
    "tradingName" TEXT NOT NULL,
    "ownerName" TEXT NOT NULL,
    "document" TEXT NOT NULL,

    CONSTRAINT "partners_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Address" (
    "id" TEXT NOT NULL,
    "partnerId" TEXT NOT NULL,
    "type" TEXT NOT NULL,
    "coordinates" INTEGER[],

    CONSTRAINT "Address_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "CoverageAreas" (
    "id" TEXT NOT NULL,
    "partnerId" TEXT NOT NULL,
    "type" TEXT NOT NULL,
    "coordinates" INTEGER[],

    CONSTRAINT "CoverageAreas_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "partners_id_key" ON "partners"("id");

-- CreateIndex
CREATE UNIQUE INDEX "Address_partnerId_key" ON "Address"("partnerId");

-- CreateIndex
CREATE UNIQUE INDEX "CoverageAreas_partnerId_key" ON "CoverageAreas"("partnerId");

-- AddForeignKey
ALTER TABLE "Address" ADD CONSTRAINT "Address_id_fkey" FOREIGN KEY ("id") REFERENCES "partners"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CoverageAreas" ADD CONSTRAINT "CoverageAreas_id_fkey" FOREIGN KEY ("id") REFERENCES "partners"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

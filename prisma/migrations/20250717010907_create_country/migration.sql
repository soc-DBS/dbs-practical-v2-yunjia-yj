-- CreateTable
CREATE TABLE "country" (
    "countryName" VARCHAR(30) NOT NULL,
    "language" VARCHAR(30) NOT NULL,
    "region" VARCHAR(30) NOT NULL,

    CONSTRAINT "country_pkey" PRIMARY KEY ("countryName")
);

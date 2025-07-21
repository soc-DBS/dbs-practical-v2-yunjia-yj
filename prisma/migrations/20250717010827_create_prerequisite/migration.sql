-- CreateTable
CREATE TABLE "pre_requisite" (
    "modCode" VARCHAR(10) NOT NULL,
    "requisite" VARCHAR(10) NOT NULL,

    CONSTRAINT "pre_requisite_pkey" PRIMARY KEY ("modCode","requisite")
);

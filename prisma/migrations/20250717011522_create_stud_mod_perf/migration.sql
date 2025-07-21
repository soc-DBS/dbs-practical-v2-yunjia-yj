-- CreateTable
CREATE TABLE "stud_mod_performance" (
    "admNo" CHAR(4) NOT NULL,
    "modRegistered" VARCHAR(10) NOT NULL,
    "mark" INTEGER NOT NULL,
    "grade" CHAR(2) NOT NULL,

    CONSTRAINT "stud_mod_performance_pkey" PRIMARY KEY ("admNo","modRegistered")
);

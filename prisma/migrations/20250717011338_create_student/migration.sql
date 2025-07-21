-- CreateTable
CREATE TABLE "student" (
    "adminNo" CHAR(4) NOT NULL,
    "studName" VARCHAR(30) NOT NULL,
    "gender" CHAR(1) NOT NULL,
    "address" CHAR(100) NOT NULL,
    "mobilePhone" CHAR(8) NOT NULL,
    "homePhone" CHAR(8) NOT NULL,
    "dob" DATE NOT NULL,
    "nationality" VARCHAR(30) NOT NULL,
    "crseCode" CHAR(5) NOT NULL,

    CONSTRAINT "student_pkey" PRIMARY KEY ("adminNo")
);

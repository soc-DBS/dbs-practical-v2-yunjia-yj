/*
  Warnings:

  - The primary key for the `country` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `countryName` on the `country` table. All the data in the column will be lost.
  - The primary key for the `pre_requisite` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `modCode` on the `pre_requisite` table. All the data in the column will be lost.
  - The primary key for the `stud_mod_performance` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `admNo` on the `stud_mod_performance` table. All the data in the column will be lost.
  - You are about to drop the column `modRegistered` on the `stud_mod_performance` table. All the data in the column will be lost.
  - The primary key for the `student` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `adminNo` on the `student` table. All the data in the column will be lost.
  - You are about to drop the column `crseCode` on the `student` table. All the data in the column will be lost.
  - You are about to drop the column `homePhone` on the `student` table. All the data in the column will be lost.
  - You are about to drop the column `mobilePhone` on the `student` table. All the data in the column will be lost.
  - You are about to drop the column `studName` on the `student` table. All the data in the column will be lost.
  - Added the required column `country_name` to the `country` table without a default value. This is not possible if the table is not empty.
  - Added the required column `mod_code` to the `pre_requisite` table without a default value. This is not possible if the table is not empty.
  - Added the required column `adm_no` to the `stud_mod_performance` table without a default value. This is not possible if the table is not empty.
  - Added the required column `mod_registered` to the `stud_mod_performance` table without a default value. This is not possible if the table is not empty.
  - Added the required column `adm_no` to the `student` table without a default value. This is not possible if the table is not empty.
  - Added the required column `crse_code` to the `student` table without a default value. This is not possible if the table is not empty.
  - Added the required column `stud_name` to the `student` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "pre_requisite" DROP CONSTRAINT "pre_requisite_mod_code_fk";

-- DropForeignKey
ALTER TABLE "stud_mod_performance" DROP CONSTRAINT "stud_mod_performance_admNo_fkey";

-- DropForeignKey
ALTER TABLE "stud_mod_performance" DROP CONSTRAINT "stud_mod_performance_modRegistered_fkey";

-- DropForeignKey
ALTER TABLE "student" DROP CONSTRAINT "student_crseCode_fkey";

-- DropForeignKey
ALTER TABLE "student" DROP CONSTRAINT "student_nationality_fkey";

-- AlterTable
ALTER TABLE "country" DROP CONSTRAINT "country_pkey",
DROP COLUMN "countryName",
ADD COLUMN     "country_name" VARCHAR(30) NOT NULL,
ADD CONSTRAINT "country_pkey" PRIMARY KEY ("country_name");

-- AlterTable
ALTER TABLE "pre_requisite" DROP CONSTRAINT "pre_requisite_pkey",
DROP COLUMN "modCode",
ADD COLUMN     "mod_code" VARCHAR(10) NOT NULL,
ADD CONSTRAINT "pre_requisite_pkey" PRIMARY KEY ("mod_code", "requisite");

-- AlterTable
ALTER TABLE "stud_mod_performance" DROP CONSTRAINT "stud_mod_performance_pkey",
DROP COLUMN "admNo",
DROP COLUMN "modRegistered",
ADD COLUMN     "adm_no" CHAR(4) NOT NULL,
ADD COLUMN     "mod_registered" VARCHAR(10) NOT NULL,
ALTER COLUMN "mark" DROP NOT NULL,
ALTER COLUMN "grade" DROP NOT NULL,
ADD CONSTRAINT "stud_mod_performance_pkey" PRIMARY KEY ("adm_no", "mod_registered");

-- AlterTable
ALTER TABLE "student" DROP CONSTRAINT "student_pkey",
DROP COLUMN "adminNo",
DROP COLUMN "crseCode",
DROP COLUMN "homePhone",
DROP COLUMN "mobilePhone",
DROP COLUMN "studName",
ADD COLUMN     "adm_no" CHAR(4) NOT NULL,
ADD COLUMN     "crse_code" VARCHAR(5) NOT NULL,
ADD COLUMN     "home_phone" CHAR(8),
ADD COLUMN     "mobile_phone" CHAR(8),
ADD COLUMN     "stud_name" VARCHAR(30) NOT NULL,
ALTER COLUMN "address" SET DATA TYPE VARCHAR(100),
ADD CONSTRAINT "student_pkey" PRIMARY KEY ("adm_no");

-- RenameForeignKey
ALTER TABLE "course" RENAME CONSTRAINT "fk_course_offered_by" TO "course_offered_by_fk";

-- AddForeignKey
ALTER TABLE "pre_requisite" ADD CONSTRAINT "pre_requisite_mod_code_fk" FOREIGN KEY ("mod_code") REFERENCES "module"("mod_code") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "stud_mod_performance" ADD CONSTRAINT "stud_mod_performance_adm_no_fkey" FOREIGN KEY ("adm_no") REFERENCES "student"("adm_no") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "stud_mod_performance" ADD CONSTRAINT "stud_mod_performance_mod_registered_fkey" FOREIGN KEY ("mod_registered") REFERENCES "module"("mod_code") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "student" ADD CONSTRAINT "student_crse_code_fk" FOREIGN KEY ("crse_code") REFERENCES "course"("crse_code") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "student" ADD CONSTRAINT "student_nationality_fk" FOREIGN KEY ("nationality") REFERENCES "country"("country_name") ON DELETE NO ACTION ON UPDATE NO ACTION;

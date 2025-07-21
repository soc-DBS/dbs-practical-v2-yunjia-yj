-- AddForeignKey
ALTER TABLE "student" ADD CONSTRAINT "student_crseCode_fkey" FOREIGN KEY ("crseCode") REFERENCES "course"("crse_code") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "student" ADD CONSTRAINT "student_nationality_fkey" FOREIGN KEY ("nationality") REFERENCES "country"("countryName") ON DELETE NO ACTION ON UPDATE NO ACTION;

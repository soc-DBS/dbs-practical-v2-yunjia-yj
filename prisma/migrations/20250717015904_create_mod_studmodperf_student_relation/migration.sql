-- AddForeignKey
ALTER TABLE "stud_mod_performance" ADD CONSTRAINT "stud_mod_performance_admNo_fkey" FOREIGN KEY ("admNo") REFERENCES "student"("adminNo") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "stud_mod_performance" ADD CONSTRAINT "stud_mod_performance_modRegistered_fkey" FOREIGN KEY ("modRegistered") REFERENCES "module"("mod_code") ON DELETE NO ACTION ON UPDATE NO ACTION;

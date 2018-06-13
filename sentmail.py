import smtplib

content="""To BE-B Students,
75% attendance is compulsory.
Otherwise, you won't be allowed to appear for Exam.
Mayur Patil,
Class Teacher BE-B"""

mail=smtplib.SMTP('smtp.gmail.com',587)
mail.ehlo()
mail.starttls()
mail.login('mspatil@comp.mitaoe.ac.in', 'mitaoe2014')

header = 'From: '+"mspatil@comp.mitaoe.ac.in"+'\n''To:'+'linuxcraz23@gmail.com'+'\n'+'Subject: Maintain Attendance 75% for each subject \n'

content = header + content
mail.sendmail("mspatil@comp.mitaoe.ac.in","linuxcraz23@gmail.com",content)
print("Mail Sent Successfully")
mail.close()
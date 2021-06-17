# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'seeding database'

users = [
  ['kleinen@infrastructure.de', :admin],
  ['admin@mail.de', :admin],
  ['reader@mail.de', :reader],
  ['writer@mail.de', :writer],
  ['editor@mail.de', :editor],
  ['qa@mail.de', :qa]
]

User.destroy_all
Course.destroy_all
Program.destroy_all
CourseConnection.destroy_all
CourseProgram.destroy_all
users.each do |u|
  user = User.create(email: u[0], password: 'geheim12', password_confirmation: 'geheim12', approved: true, confirmed_at: DateTime.now, role: u[1])
  puts "created User #{user.email} as #{user.role}"
end
user = User.create(email: 'unapproved@mail.de', password: 'geheim12', password_confirmation: 'geheim12', approved: false)
puts "created unapproved User #{user.email}"

# CourseProgram.destroy_all
# Program.destroy_all
# Course.destroy_all

imib = Program.create(name: 'Internationale Medieninformatik', code: 'IMI-B', degree: 'Bachelor', ects: 180)

# ALT [Semester, Code, Name, required, methods,methods, sws, ect , frequency]

# NEU [Semester, Code, Name, required, mission, ects, examination, objectives, contents, prerequisites, literature, methods, 
# skills_knowledge_understanding, skills_intellectual, skills_practical, skills_general, lectureHrs, labHrs, tutorialHrs,
# equipment, room, responsible_person, comment, frequency?]


courses = [
  [1, 'B1', 'Informatik 1', 'required', ['Kenntnisse der Grundbegriffe der Informatik und Programmierung', 
  'Kenntnisse der primitiven Datenstrukturen und der Kontrollstrukturen', 'Fähigkeit, einfache Veränderungen an einem bestehendn System
  vornehmen zu können mit einer Programmiersprache', 'Fähigkeit, ein syntaktisch einwandfreies Programm in einer geeigneten Programmiersprache zu erstellen',
  'Verständnis für den Unterschied zwischen Klasse und Objekt', 'Verständnis für den Prozess des Programmentwurfs', 'Verständnis für Lokalisierungsprobleme (internationale Zeichensätze, Bezeichnungen)', 'Fähigkeit, mit Hilfe eines Debuggers Programmfehler aufzuspüren'], '6', 'Klausur & Abgaben', 'Die Studierenden haben gelernt, geeignete Berichte über ihre Programmiertätigkeit anzufertigen und im Internet zu publizieren.', 'Programmieren mit Java', 'Keine', 'Lektüre A', 'P SL/Ü','Java', 'Java', 'Java', 'Java', '4','2', '2', 'PC/Mac', '234', 'Kleinen','Das ist ein Kommentar'],
  [1, 'B2', 'Computersysteme', 'required', ['Kenntnisse in den Bereichen', 
  'Informatikgrundlagen, Logik', 'Computerkonzepte, Technologie und Computerbauelemente', 'Hardware-/Software-Schnittstellen',
  'Sicherer Umgang mit unterschiedlichen Betriebssystemen', 'Fundiertes Wissen zur rechnerinternen Informationsdarstellung', 'Verständnis von Computeraufbau: CPU, Chipsätze, Bussysteme
  Schnittstellen, Speichertechnologien, Datenträger', 'Zusammenwirken von Hardware, Bios und Betriebssystem, Verwaltung der Systemressourcen'], '5', 'Klausur & Abgaben', '', 'Computersysteme', 'Keine', 'Lektüre B', 'P SL/Ü','CS', 'CS', 'CS', 'CS', '2','2', '0', 'PC/Mac', '111', 'Henning','Das ist ein Kommentar'],
  [1, 'B3', 'Propädeutikum und  Medientheorie', 'required', [], '5', 'Klausur', '', 'Medientheorie', 'Keine', 'Lektüre C', 'P SL/Ü','Medientheorie', 'Medientheorie', '', '', '2','2', '0', '', '345', 'Busch','Das ist ein Kommentar'],
  [1, 'B4', 'Mathematik für Medieninformatik 1', 'required', [], '5', 'Klausur und Abgaben', 'Mathe Grundagen Informatik', 'Rechnen', 'Mathe in der Schule', 'Lektüre D', 'P SL/Ü','Mathe', '', '', '', '2','2', '0', '', '322', 'Thiel','Das ist ein Kommentar'],
  [1, 'B5', 'Grundlagen  der  Webprogrammierung', 'required', [], '5', 'Klausur und Abgaben', '', '', '', '', 'P SL/Ü','', '', '', '', '2','2', '0', '', '', '','Das ist ein Kommentar'],
  [1, 'B6', '1. Fremdsprache 1', 'required', [], '4', 'Klausur', '', '', '', '', 'WP Ü','', '', '', '', '0','4', '0', '', '', '','Das ist ein Kommentar'],

  [2, 'B7', 'Informatik 2', 'required', [], '5', 'Klausur und Abgaben', '', '', '', '', 'P SL/Ü','', '', '', '', '4','2', '2', '', '', '','Das ist ein Kommentar'],
  [2, 'B8', 'Grundlagen Digitaler Medien', 'required', [], '6', 'Klausur und Abgaben', '', '', '', '', 'P SL/Ü','', '', '', '', '4','2', '0', '', '', '','Das ist ein Kommentar'],
  [2, 'B9', 'Netzwerke', 'required', [], '5', 'Klausur und Abgaben', '', '', '', '', 'P SL/Ü','', '', '', '', '2','1', '0', '', '', '','Das ist ein Kommentar'],
  [2, 'B10', 'Mathematik für Medieninformatik 2 ', 'required', [], '5', 'Klausur und Abgaben', '', '', '', '', 'P SL/Ü','', '', '', '', '2','1', '0', '', '', '','Das ist ein Kommentar'],
  [2, 'B11', 'Medienwirtschaft', 'required', [], '5', 'Klausur', '', '', '', '', 'P SL/Ü','', '', '', '', '4','1', '0', '', '', '','Das ist ein Kommentar'],
  [2, 'B12', '1. Fremdsprache 2', 'required', [], '4', 'Klausur', '', '', '', '', 'WP Ü','', '', '', '', '0','4', '0', '', '', '','Das ist ein Kommentar'],

  [3, 'B13', 'Bildverarbeitung', 'required', [], '5', 'Klausur und Abgaben', '', '', '', '', 'P SL/Ü','', '', '', '', '2','2', '0', '', '', '','Das ist ein Kommentar'],
  [3, 'B14', 'Datenbanken', 'required', [], '5', 'Klausur und Projekt', '', '', '', '', 'P SL/Ü','', '', '', '', '2','2', '0', '', '', '','Das ist ein Kommentar'],
  [3, 'B15', 'Informatik 3 ', 'required', [], '6', 'Klausur und Abgaben', '', '', '', '', 'P SL/Ü','', '', '', '', '4','2', '0', '', '', '','Das ist ein Kommentar'],
  [3, 'B16', '2. Fremdsprache', 'required', [], '4', 'Klausur', '', '2. Fremdsprache (andere Sprache als 1. Fremdsprache), wählbar aus dem Angebot der ZE Fremdsprachen', '', '', 'WP Ü','', '', '', '', '0','4', '0', '', '', '','Das ist ein Kommentar'],
  [3, 'B17', 'Computergrafik', 'required', [], '5', 'Klausur', '', '', '', '', 'P SL/Ü','', '', '', '', '2','2', '0', '', '', '','Das ist ein Kommentar'],
  [3, 'B18', '3D-Design', 'required', [], '5', 'Klausur', '', '', '', '', 'P Ü','', '', '', '', '0','2', '0', '', '', '','Das ist ein Kommentar'],
  
  [4, 'B19', 'Internationale   Medienwirtschaft  und  Kommunikation', 'required', [], '5', 'Projekt und Präsentation', '', '', '', '', 'P SL/Ü','', '', '', '', '2','2', '0', '', '', '','Das ist ein Kommentar'],
  [4, 'B20', 'Praxisphase 1:  Fachpraktikum im  Ausland', 'required', [], '25', '', '', '', '', '', '','', '', '', '', '','', '', '', '', '','Das ist ein Kommentar'],
  [4, 'B20.1', 'Auswertung  von Erfahrungen am Praxisplatz', 'required', [], '', 'Chat', '', '', '', '', 'P Ü','', '', '', '', '0','2', '0', '', '', '','Das ist ein Kommentar'],
  [4, 'B20.2', 'Fachpraktikum', 'required', [], '', 'Praktikum', '', '', '', '', '','', '', '', '', '','', '', '', '', '','Das ist ein Kommentar'],

  [5, 'B21', 'Wahlpflichtmodul 1', 'required', [], '5', 'Klausur', '', '', '', '', 'WP SL/Ü','', '', '', '', '2','2', '0', '', '', '','Das ist ein Kommentar'],
  [5, 'B22', 'Wahlpflichtmodul 2', 'required', [], '5', 'Klausur', '', '', '', '', 'WP SL/Ü','', '', '', '', '2','2', '0', '', '', '','Das ist ein Kommentar'],
  [5, 'B23', 'Wahlpflichtmodul 3', 'required', [], '5', 'Klausur', '', '', '', '', 'WP SL/Ü','', '', '', '', '2','2', '0', '', '', '','Das ist ein Kommentar'],
  [5, 'B24', 'Praxisphase 2:Praxisprojekt', 'required', [], '15', 'Projekt und Präsentation', '', '', '', '', 'WP','', '', '', '', '0','15', '0', '', '', '','Das ist ein Kommentar'],
  [5, 'B24.1', 'Projektmanagement', 'required', [], '', '', '', '', '', '', 'P Ü','', '', '', '', '0','2', '0', '', '', '','Das ist ein Kommentar'],

  [6, 'B25', 'Wahlpflichtmodul 4', 'required', [], '5', 'Klausur', '', '', '', '', 'WP SL/Ü','', '', '', '', '2','2', '0', '', '', '','Das ist ein Kommentar'],
  [6, 'B26', 'Wahlpflichtmodul 5', 'required', [], '5', 'Klausur', '', '', '', '', 'WP SL/Ü','', '', '', '', '2','2', '0', '', '', '','Das ist ein Kommentar'],
  [6, 'B27', 'AWE:  Medienrecht', 'required', [], '2', 'Mündlich', '', '', '', '', 'P SL','', '', '', '', '2','0', '0', '', '', '','Das ist ein Kommentar'],
  [6, 'B28', 'AWE:  WP', 'required', [], '2', '', '', '', '', '', 'P SL','', '', '', '', '2','0', '0', '', '', '','Das ist ein Kommentar'],
  [6, 'B29', 'Bachelorarbeit', 'required', [], '12', 'BA', '', '', '', '', 'P','', '', '', '', '','', '', '', '', '','Das ist ein Kommentar'],
  [6, 'B30', 'Bachelorseminar/Kolloquium', 'required', [], '4', 'Präsentation', '', '', '', '', 'P Ü','', '', '', '', '1','', '0', '', '', '','Das ist ein Kommentar'],

  [0, 'GT1', 'AI for Games', 'elective', [], '5', 'Präsentation', '', '', '', '', 'SL/Ü','', '', '', '', '2','2', '0', '', '', '','Das ist ein Kommentar', 'SoSe'],
  [0, 'VC1', 'Bild- und Videokompression', 'elective', [], '5', 'Präsentation', '', '', '', '', 'SL/Ü','', '', '', '', '2','2', '0', '', '', '','Das ist ein Kommentar', 'SoSe'],
  [0, 'GTAT1', 'Game Technology & Interactive Systems – Aktuelle Themen 1', 'elective', [], '5', 'Präsentation', '', '', '', '', 'SL/Ü','', '', '', '', '2','2', '0', '', '', '','Das ist ein Kommentar', 'SoSe'],
  [0, 'VCAT1', 'Visual Computing – Aktuelle Themen 1', 'elective', [], '5', 'Präsentation', '', '', '', '', 'SL/Ü','', '', '', '', '2','2', '0', '', '', '','Das ist ein Kommentar', 'SoSe'],
  [0, 'WTAT1', 'Web Technology – Aktuelle Themen 1 ', 'elective', [], '5', 'Präsentation', '', '', '', '', 'SL/Ü','', '', '', '', '2','2', '0', '', '', '','Das ist ein Kommentar', 'SoSe'],
  [0, 'GT2', 'Game  Engines', 'elective', [], '5', 'Präsentation', '', '', '', '', 'SL/Ü','', '', '', '', '2','2', '0', '', '', '','Das ist ein Kommentar', 'WiSe'],
  [0, 'VC2', 'Bildanalyse', 'elective', [], '5', 'Präsentation', '', '', '', '', 'SL/Ü','', '', '', '', '2','2', '0', '', '', '','Das ist ein Kommentar', 'WiSe'],
  [0, 'WT2', 'Usability', 'elective', [], '5', 'Präsentation', '', '', '', '', 'SL/Ü','', '', '', '', '2','2', '0', '', '', '','Das ist ein Kommentar', 'WiSe'],
  [0, 'GTAT2', 'Game Technology & Interactive Systems – Aktuelle Themen 2', 'elective', [], '5', 'Präsentation', '', '', '', '', 'SL/Ü','', '', '', '', '2','2', '0', '', '', '','Das ist ein Kommentar', 'WiSe'],
  [0, 'VCAT2', 'Visual  Computing – Aktuelle Themen 2', 'elective', [], '5', 'Präsentation', '', '', '', '', 'SL/Ü','', '', '', '', '2','2', '0', '', '', '','Das ist ein Kommentar', 'WiSe'],
  [0, 'WTAT2', 'Web  Technology – Aktuelle Themen 2', 'elective', [], '5', 'Präsentation', '', '', '', '', 'SL/Ü','', '', '', '', '2','2', '0', '', '', '','Das ist ein Kommentar', 'WiSe'],

  #SPRACHEN

  [0, 'M2Ts Englisch', 'Englisch Mittelstufe 2/Technik (GER B2.1)', 'elective', [], '4', '', '', '', '', '', 'WP Ü','', '', '', '', '0','4', '0', '', '', '','Das ist ein Kommentar'],
  [0, 'M1WS Französisch', 'Französisch Mittelstufe 1/Wirtschaft (GER B1.2)', 'elective', [], '4', '', '', '', '', '', 'WP Ü','', '', '', '', '0','4', '0', '', '', '','Das ist ein Kommentar'],
  [0, 'M1WS Russisch', 'Russisch Mittelstufe 1/Wirtschaft (GER B1.2)', 'elective', [], '4', '', '', '', '', '', 'WP Ü','', '', '', '', '0','4', '0', '', '', '','Das ist ein Kommentar'],
  [0, 'M1WS Spanisch', 'Spanisch Mittelstufe 1/Wirtschaft (GER B1.2)', 'elective', [], '4', '', '', '', '', '', 'WP Ü','', '', '', '', '0','4', '0', '', '', '','Das ist ein Kommentar'],
  [0, 'M3TS Englisch', 'Englisch Mittelstufe 3/Technik (GER B2.2)', 'elective', [], '4', '', '', '', '', '', 'WP Ü','', '', '', '', '0','4', '0', '', '', '','Das ist ein Kommentar'],
  [0, 'M2WS Französisch', 'Englisch Mittelstufe 2/Wirtschaft (GER B2.1)', 'elective', [], '4', '', '', '', '', '', 'WP Ü','', '', '', '', '0','4', '0', '', '', '','Das ist ein Kommentar'],
  [0, 'M2WS Russisch', 'Russisch Mittelstufe 2/Wirtschaft (GER B2.1)', 'elective', [], '4', '', '', '', '', '', 'WP Ü','', '', '', '', '0','4', '0', '', '', '','Das ist ein Kommentar'],
  [0, 'M2WS Spanisch', 'Spanisch Mittelstufe 2/Wirtschaft (GER B2.1)', 'elective', [], '4', '', '', '', '', '', 'WP Ü','', '', '', '', '0','4', '0', '', '', '','Das ist ein Kommentar'],
  #oder eine 2. Fremdsprachee (andere Sprache als 1. Fremdsprache),wählbar aus dem Angebot der ZE Fremdsprachen
]


courses.each do |a|
  puts "handling #{a}"

  c = Course.create(code: a[1].strip,
                    name: a[2].strip,
                    mission: a[4],
                    ects: a[5].strip.to_i,
                    examination: a[6].strip,
                    objectives: a[7].strip,
                    contents: a[8].strip,
                    prerequisites: a[9].strip,
                    literature: a[10].strip,
                    methods: a[11].strip,
                    skills_knowledge_understanding: a[12].strip,
                    skills_intellectual: a[13].strip,
                    skills_practical: a[14].strip,
                    skills_general: a[15].strip,
                    lectureHrs: a[16].strip.to_i,
                    labHrs: a[17].strip.to_i,
                    tutorialHrs: a[18].strip.to_i,
                    equipment: a[19].strip,
                    room: a[20].strip,
                    responsible_person: a[21].strip,
                    comment: a[22].strip,
                    frequency: !a[23].nil? ? (a[23].strip) : nil)
  cp = CourseProgram.create(course: c, program: imib,
                            semester: a[0],
                            required: a[3].strip)       
end


#----CourseConnections----


b6 = Course.find_by(code: "B6").code
CourseConnection.create(parent_course_code: b6,child_course_code:  Course.find_by(code: "M2Ts Englisch").code, required: "elective")
CourseConnection.create(parent_course_code: b6,child_course_code:  Course.find_by(code: "M1WS Französisch").code, required: "elective")
CourseConnection.create(parent_course_code: b6, child_course_code:  Course.find_by(code: "M1WS Russisch").code, required: "elective")
CourseConnection.create(parent_course_code: b6, child_course_code:  Course.find_by(code: "M1WS Spanisch").code, required: "elective")

b12 = Course.find_by(code: "B12").code  
CourseConnection.create(parent_course_code: b12, child_course_code:  Course.find_by(code: "M3TS Englisch").code, required: "elective")                  
CourseConnection.create(parent_course_code: b12,child_course_code:  Course.find_by(code: "M2WS Französisch").code, required: "elective")                                            
CourseConnection.create(parent_course_code: b12, child_course_code:  Course.find_by(code: "M2WS Russisch").code, required: "elective")                   
CourseConnection.create(parent_course_code: b12, child_course_code:  Course.find_by(code: "M2WS Spanisch").code, required: "elective")

b20 = Course.find_by(code: "B20").code  
CourseConnection.create(parent_course_code: b20, child_course_code:  Course.find_by(code: "B20.1").code, required: "required")
CourseConnection.create(parent_course_code: b20, child_course_code:  Course.find_by(code: "B20.2").code, required: "required")                  

b24 = Course.find_by(code: "B24").code  
CourseConnection.create(parent_course_code: b24, child_course_code:  Course.find_by(code: "B24.1").code, required: "required")

#WPs
x = 21
while x < 27
  if x == 24
    x = 25
  end
  b = Course.find_by(code: "B#{x}").code
  CourseConnection.create(parent_course_code: b, child_course_code:  Course.find_by(code: "GT1").code, required: "elective")
  CourseConnection.create(parent_course_code: b, child_course_code:  Course.find_by(code: "VC1").code, required: "elective")
  CourseConnection.create(parent_course_code: b, child_course_code:  Course.find_by(code: "GTAT1").code, required: "elective")
  CourseConnection.create(parent_course_code: b, child_course_code:  Course.find_by(code: "WTAT1").code, required: "elective")
  CourseConnection.create(parent_course_code: b, child_course_code:  Course.find_by(code: "VCAT1").code, required: "elective")
  CourseConnection.create(parent_course_code: b, child_course_code:  Course.find_by(code: "GT2").code, required: "elective")
  CourseConnection.create(parent_course_code: b, child_course_code:  Course.find_by(code: "VC2").code, required: "elective")
  CourseConnection.create(parent_course_code: b, child_course_code:  Course.find_by(code: "WT2").code, required: "elective")
  CourseConnection.create(parent_course_code: b, child_course_code:  Course.find_by(code: "GTAT2").code, required: "elective")
  CourseConnection.create(parent_course_code: b, child_course_code:  Course.find_by(code: "WTAT2").code, required: "elective")
  CourseConnection.create(parent_course_code: b, child_course_code:  Course.find_by(code: "VCAT2").code, required: "elective")
  x = x + 1
end

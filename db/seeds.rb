# seeding all vehicle manufacturers (limit to 2, can be unlimited but stick to 2 for less confusion.)

Manufacturer.create(name: "Toyota", country: "Japan")
Manufacturer.create(name: "BMW", country: "Germany")

puts "created #{Manufacturer.count} manufacturers"

# seeding all diagnosis categories

Diagnosis.create(name: "Oil Maintenance Required", description: "Your vehicle's engine oil needs to be changed. Please visit your dealer.")
Diagnosis.create(name: "Tire Pressure Light", description: "Your vehicle's tire pressure light is on. Please find the nearest area to inflate your tires or inspect your tires for any damage.")
Diagnosis.create(name: "Low Auxiliary Battery", description: "Your vehicles battery charge has decreased significantly, please visit your dealer for a replacement.")
Diagnosis.create(name: "Low Wiper Fluid", description: "Your vehicle has low wiper fluid. Please refill your reservoir in order to turn off the Low Fluid light.")

puts "created #{Diagnosis.count} diagnosis categories."

# seeding all diagnosis prompts

DiagnosisPrompt.create(question: "Does your dash show a *Maintenance Required* light?" , diagnosis_id: 1)
DiagnosisPrompt.create(question: "Has your car driven more than 5,000 miles?" , diagnosis_id: 1)
DiagnosisPrompt.create(question: "Is your car not running as effecient lately?", diagnosis_id: 1)
DiagnosisPrompt.create(question: "Is there a burning smell coming from your engine bay?", diagnosis_id: 1)
DiagnosisPrompt.create(question: "Has your car been sitting undriven for a long time?", diagnosis_id: 1)
DiagnosisPrompt.create(question: "Has your fuel efficiency dropped recently?", diagnosis_id: 1)
DiagnosisPrompt.create(question: "Is your engine making louder noise than usual?", diagnosis_id: 1)
DiagnosisPrompt.create(question: "Do you use your vehicle for any recreational activities? (Off-roading, racing, etc..)", diagnosis_id: 1)
DiagnosisPrompt.create(question: "Does your car shake a lot going over any bumps?", diagnosis_id: 2)
DiagnosisPrompt.create(question: "Have you driven over potholes recently?", diagnosis_id: 2)
DiagnosisPrompt.create(question: "Does your dash display an orange circle with an exclamation point in the center?", diagnosis_id: 2)
DiagnosisPrompt.create(question: "Are there any nails, screws, or any debris lodged in your wheels?", diagnosis_id: 2)
DiagnosisPrompt.create(question: "Is there any hissing noises coming from below the vehicle?", diagnosis_id: 2)
DiagnosisPrompt.create(question: "Does your car feel offset/unbalanced?", diagnosis_id: 2)
DiagnosisPrompt.create(question: "Is your car struggling to drive through areas that were easy to drive through before?", diagnosis_id: 2)
DiagnosisPrompt.create(question: "Is your car pulling to one side while driving?", diagnosis_id: 2)
DiagnosisPrompt.create(question: "Does your vehicle have a hard time starting?", diagnosis_id: 3)
DiagnosisPrompt.create(question: "Do your headlights not shine as bright as usual?", diagnosis_id: 3)
DiagnosisPrompt.create(question: "Does your car not start at all some days?", diagnosis_id: 3)
DiagnosisPrompt.create(question: "Do your vehicle windows go up/down slower than before?", diagnosis_id: 3)
DiagnosisPrompt.create(question: "Does your dash display a battery light?", diagnosis_id: 3)
DiagnosisPrompt.create(question: "Is there green, powdery deposits on your vehicles battery terminals?", diagnosis_id: 3)
DiagnosisPrompt.create(question: "Is there a foul smell coming from your engine bay? (sulfur)", diagnosis_id: 3)
DiagnosisPrompt.create(question: "Do you have to jump start your vehicle in order for it to crank?", diagnosis_id: 3)
DiagnosisPrompt.create(question: "Does your vehicle wiper pump making more noise than usual?", diagnosis_id: 4)
DiagnosisPrompt.create(question: "Does your wiper fluid spraying intermittently?", diagnosis_id: 4)
DiagnosisPrompt.create(question: "Does your dash display an outline of a windshield with a symbol depicting the washer fluid spray?", diagnosis_id: 4)
DiagnosisPrompt.create(question: "Does your vehicle spray nothing when activating the wiper fluid pump?", diagnosis_id: 4)
DiagnosisPrompt.create(question: "Is your wiper fluid reservoir showing little to no liquid?", diagnosis_id: 4)
DiagnosisPrompt.create(question: "Do you use your wiper fluid frequently?", diagnosis_id: 4)
DiagnosisPrompt.create(question: "Is there any soft, dried residue near your wipers?", diagnosis_id: 4)
DiagnosisPrompt.create(question: "Have you ever refilled your wiper fluid reservoir?", diagnosis_id: 4)

puts "created #{DiagnosisPrompt.count} diagnosis prompts."

# ALL INFORMATION SEEDED ALREADY, DO NOT CREATE ANY MORE.


# Creando a Esteban si no existe
esteban = User.find_or_create_by(email: 'esteban@example.com') do |user|
  user.password = 'password123'
  user.name = 'Esteban'
end

# Creando más usuarios
5.times do |i|
  User.find_or_create_by(email: "user_seed#{i}@example.com") do |user|
    user.password = 'password123'
    user.name = "Usuario Seed #{i}"
  end
end

# Creando ofertas laborales
5.times do |i|
  JobOffer.create!(title: "Puesto Seed #{i}", description: "Descripción del puesto #{i}")
end

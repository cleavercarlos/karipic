# Crear un usuario de prueba
user = User.find_or_create_by!(email: 'karina@example.com') do |u|
    u.password = 'password'
    u.name = 'Karina'
  end
  
  # Adjuntar una imagen de perfil al usuario (asegúrate de que el archivo de imagen exista en la ruta especificada)
  profile_image_path = Rails.root.join('db', 'seeds', 'images', 'profile_user.png')
  if File.exist?(profile_image_path)
    user.profile_image.attach(io: File.open(profile_image_path), filename: 'profile_user.png', content_type: 'image/jpeg')
  end
  
  # Crear un par de imágenes de prueba y adjuntar imágenes a las Picture
  picture1 = Picture.create!(name: 'Sunset', content: 'Beautiful sunset over the hills', user: user)
  picture2 = Picture.create!(name: 'Mountains', content: 'Snowy mountains in winter', user: user)
  
  # Adjuntar imágenes a las Pictures (asegúrate de que los archivos de imagen existan en la ruta especificada)
  picture1_image_path = Rails.root.join('db', 'seeds', 'images', 'picture1.jpg')
  if File.exist?(picture1_image_path)
    picture1.image.attach(io: File.open(picture1_image_path), filename: 'picture1.jpg', content_type: 'image/jpeg')
  end
  
  picture2_image_path = Rails.root.join('db', 'seeds', 'images', 'picture2.png')
  if File.exist?(picture2_image_path)
    picture2.image.attach(io: File.open(picture2_image_path), filename: 'picture2.png', content_type: 'image/jpeg')
  end
  
  # Crear comentarios de prueba
  Comment.create!(content: 'Amazing picture!', user: user, picture: picture1)
  Comment.create!(content: 'Looks so peaceful!', user: user, picture: picture2)
  
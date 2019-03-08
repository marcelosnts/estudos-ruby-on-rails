namespace :utils do
  desc "Popular Banco de Dados"
  task seed: :environment do
    
    # PopularContatos
    puts "Gerando os contatos (Contacts): "
    100.times do |item| 
        contato = Contact.create!(
            name: Faker::Name.name,                     # Gera um nome fake
            email: Faker::Internet.email,               # Gera um email fake
            kind: Kind.all.sample,                      # Adiciona uma amostra aleatoria da tabela kinds
            rmk: Faker::Lorem.sentence(10, false)       # Adiciona uma sentença Loroem Ipsum
        )
        puts "Contato #{contato.id} criado!"
    end
    puts "Contatos gerados com sucesso!"
    # Fim PopularContatos

    # PopularEndereços
    puts "Gerando Endereços (Addresses): "
    Contact.all.each do |contact| 
        endereco = Address.create!(
            street: Faker::Address.street_name,               # Gera um endereco fake
            city: Faker::Address.city,                        # Gera uma cidade aleatoria
            state: Faker::Address.state_abbr,                 # Gera uma sigla de estado aleatoria
            contact: contact                                  # Relaciona ao contato da vez
        )
        puts "Endereço #{endereco.id} criado!"
    end
    puts "Endereços gerados com sucesso!"
    # Fim PopularEndereços

    # PopularTelefones
    puts "Gerando Telefones (Phones): "
    Contact.all.each do |contact| 
        Random.rand(1..3).times do |cont| 
          telefone = Phone.create!(
              phone: Faker::PhoneNumber.cell_phone,             # Gera o numero de um telefone celular fake            
              contact: contact                                  # Relaciona ao contato da vez
          )
          puts "Telefone #{telefone.id} criado!"
        end
    end
    puts "Telefones gerados com sucesso!"
    # Fim PopularTelefones
  end
end
require "faker"

20.times do
    Article.create(
        title: Faker::Book.title,
        content: Faker::Lorem.paragraph(sentence_count: 10)
    )
end

fixture 'app'
    .page 'http://localhost:3000/books/new';

const counter = Math.round(new Date ()).gettime ()/100)

test('MyTest', async t => {
    await t
        .typeText('#book_title', 'title' + counter)
        .typeText('#book_description', 'Description' + counter )
        .typeText('#book_genre_list-selectixed',  'abcdef')
        .setFilesToUpload('#book_cover', '')
        .setFileToUpload('#@book_realated_image;, '')

        .click('#input[type="submit"]');
  await t 
      .expect(Selector('.jumbotron h2').innerText).eql(title)
await t.debug
})

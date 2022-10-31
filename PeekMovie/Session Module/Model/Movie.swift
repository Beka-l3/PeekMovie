//
//  Movie.swift
//  PeekMovie
//
//  Created by Bekzhan Talgat on 31.10.2022.
//

struct Movie: Codable {
    let movieId: String
    let rating: Float
    let img: String
    let title: String
    let summary: String
    let year: Int
    let prod: String
}



extension PosterViewPage {
    struct Movies {
        let movies: [Movie] = {
            let m: [Movie] = [
                Movie(
                    movieId: "movieId1",
                    rating: 8.4,
                    img: "us",
                    title: "Us",
                    summary: "Adelaide Wilson and her family are attacked by mysterious figures dressed in red. Upon closer inspection, the Wilsons realise that the intruders are exact lookalikes of them.\n\nUs is a 2019 American horror film written and directed by Jordan Peele, starring Lupita Nyong'o, Winston Duke, Elisabeth Moss, and Tim Heidecker. The film follows Adelaide Wilson (Nyong'o) and her family, who are attacked by a group of menacing doppelgängers.\n\nThe project was announced in February 2018, and much of the cast joined in the following months. Peele produced the film alongside Jason Blum and Sean McKittrick (the trio previously having collaborated on Get Out and BlacKkKlansman), as well as Ian Cooper. Filming took place in California, mostly in Los Angeles, Pasadena and Santa Cruz, from July to October 2018.",
                    year: 2019,
                    prod: "Jordan Peele"
                ),
                Movie(
                    movieId: "movieId2",
                    rating: 7.4,
                    img: "moon",
                    title: "Moonlight",
                    summary: "Chiron, a young African-American boy, finds guidance in Juan, a drug dealer, who teaches him to carve his own path. As he grows up in Miami, Juan's advice leaves a lasting impression on him.\n\nMoonlight is a 2016 American coming-of-age drama film written and directed by Barry Jenkins, based on Tarell Alvin McCraney's unpublished semi-autobiographical play In Moonlight Black Boys Look Blue. The film stars Trevante Rhodes, André Holland, Janelle Monáe, Ashton Sanders, Jharrel Jerome, Naomie Harris, and Mahershala Ali.\n\nThe film presents three stages in the life of the main character: his childhood, adolescence, and early adult life. It explores the difficulties he faces with his sexuality and identity, including the physical and emotional abuse he endures growing up.[4] Filmed in Miami, Florida, beginning in 2015, Moonlight premiered at the Telluride Film Festival on September 2, 2016. It was released in the United States on October 21, 2016, by A24, receiving universal acclaim and grossing over $65 million worldwide.",
                    year: 2016,
                    prod: "Barry Jenkins"
                ),
                Movie(
                    movieId: "movieId3",
                    rating: 8.2,
                    img: "1917",
                    title: "1917",
                    summary: "Two soldiers, assigned the task of delivering a critical message to another battalion, risk their lives for the job in order to prevent them from stepping right into a deadly ambush.\n\n1917 is a 2019 war film directed and produced by Sam Mendes, who co-wrote the film with Krysty Wilson-Cairns. Partially inspired by stories told to Mendes by his paternal grandfather Alfred about his service during World War I,[6] the film takes place after the German retreat to the Hindenburg Line during Operation Alberich, and follows two British soldiers, Will Schofield (George MacKay) and Tom Blake (Dean-Charles Chapman), in their mission to deliver an important message to call off a doomed offensive attack. Mark Strong, Andrew Scott, Richard Madden, Claire Duburcq, Colin Firth, and Benedict Cumberbatch also star in supporting roles.\n\nThe project was announced in June 2018, with MacKay and Chapman signing on in October and the rest of the cast joining the following March. Filming took place from April to June 2019 in the UK, with cinematographer Roger Deakins and editor Lee Smith using long takes to have the entire film appear as two continuous shots.",
                    year: 2020,
                    prod: "Sam Mendes"
                ),
                Movie(
                    movieId: "movieId4",
                    rating: 5.5,
                    img: "after",
                    title: "After",
                    summary: "After is a 2019 American romantic drama film directed by Jenny Gage and written by Gage, Susan McMartin and Tamara Chestna, based on the 2014 novel of the same name by Anna Todd. The film stars Josephine Langford and Hero Fiennes Tiffin, and follows an inexperienced teenage girl who begins to romance a mysterious student during her first months of college. The cast includes Selma Blair, Inanna Sarkis, Shane Paul McGhie, Pia Mia, Khadijha Red Thunder, Dylan Arnold, Samuel Larsen, Jennifer Beals and Peter Gallagher in supporting roles.\n\nAfter premiered at The Grove in Los Angeles on April 8, 2019. Despite largely negative reviews from critics, who felt its screenplay and narrative glamourized abusive relationships, it was a commercial success, grossing $69.5 million worldwide against its $14 million budget.",
                    year: 2019,
                    prod: "Jenny Gage"
                ),
                Movie(
                    movieId: "movieId5",
                    rating: 8.4,
                    img: "joker",
                    title: "Joker",
                    summary: "Arthur Fleck, a party clown, leads an impoverished life with his ailing mother. However, when society shuns him and brands him as a freak, he decides to embrace the life of crime and chaos.\n\nJoker is a 2019 American psychological thriller film directed by Todd Phillips, who also co-wrote the screenplay with Scott Silver. The film, based on DC Comics characters, stars Joaquin Phoenix as the Joker and serves as a standalone origin story for the character. Set in 1981, it follows Arthur Fleck, a failed clown and aspiring stand-up comedian whose descent into insanity and nihilism inspires a violent countercultural revolution against the wealthy in a decaying Gotham City. Robert De Niro, Zazie Beetz, and Frances Conroy appear in supporting roles. Distributed by Warner Bros. Pictures, Joker was produced by Warner Bros. Pictures and DC Films in association with Village Roadshow Pictures, Bron Creative and Joint Effort.",
                    year: 2019,
                    prod: "Todd Philips"
                ),
                Movie(
                    movieId: "movieId6",
                    rating: 7.9,
                    img: "boh",
                    title: "Bohemian Rhapsody",
                    summary: "With his impeccable vocal abilities, Freddie Mercury and his rock band, Queen, achieve superstardom. However, amidst his skyrocketing success, he grapples with his ego, sexuality and a fatal illness.\n\nBohemian Rhapsody is a 2018 biographical musical film directed by Bryan Singer[a] from a screenplay by Anthony McCarten, and produced by Graham King and Queen manager Jim Beach. It focuses on the life of Freddie Mercury, the lead singer of the British rock band Queen, from the formation of the band in 1970 to their 1985 Live Aid performance at the original Wembley Stadium. It stars Rami Malek as Mercury, with Lucy Boynton, Gwilym Lee, Ben Hardy, Joe Mazzello, Aidan Gillen, Tom Hollander, and Mike Myers in supporting roles. Queen members Brian May and Roger Taylor also served as consultants. A British-American venture, it was produced by Regency Enterprises, GK Films and Queen Films, and was distributed by 20th Century Fox.",
                    year: 2018,
                    prod: "Bryan Singer"
                )
            ]
            return m
        }()
        private var idx = 0
        
        func getMovie() -> Movie { movies[idx] }
        mutating func increase() { idx = (idx+1) % movies.count }
    }
}

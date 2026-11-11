\version "2.24.3"
% Scan 138, printed p. 113, Mecklenburg Cantional: first Kyrie call and response.
% The middle treble head on “me” is provisionally read as A-sharp.
#(set-global-staff-size 18)
\header { tagline = ##f }
\paper { paper-width = 120\mm left-margin = 4\mm right-margin = 0\mm top-margin = 0\mm bottom-margin = 0\mm indent = 0\mm print-page-number = ##f page-breaking = #ly:one-page-breaking }
\score {
  \new Staff <<
    \clef treble \omit Staff.TimeSignature \cadenzaOn
    \new Voice = "chant" { \voiceOne g'\breve^\markup \tiny "Liturg." d'1( g'1) a'1 b'1( a'1) b'1 g'\breve \bar "||" }
    \new Lyrics \lyricsto "chant" { \set ignoreMelismata = ##t Ky -- ri -- \skip 1 \skip 1 "e!" E -- lei -- "son!" }
  >>
  \layout { ragged-right = ##f \context { \Score \remove "Bar_number_engraver" } }
}
\score {
  \new PianoStaff <<
    \new Staff <<
      \clef treble \time 2/2 \cadenzaOn \accidentalStyle forget
      \new Voice = "response" { \voiceOne c''1^\markup \tiny "Respons." \bar "|" a'1 \bar "|" b'1 <ais'! b'>1 \bar "|" a'\breve\fermata \bar "||" }
      \new Voice = "responseLower" { \voiceTwo e'2 e'2 \bar "|" a'1( \bar "|" a'1) gis'!1 \bar "|" a'\breve \bar "||" }
    >>
    \new Lyrics \lyricsto "response" { "HErr," er -- bar -- me "dich!" }
    \new Lyrics \lyricsto "responseLower" { \set ignoreMelismata = ##t "HErr," er -- bar -- \skip 1 me "dich!" }
    \new Staff <<
      \clef bass \time 2/2 \cadenzaOn \accidentalStyle forget
      \new Voice { \voiceOne a1 \bar "|" c'1 \bar "|" f'1 e'1 \bar "|" e'\breve \bar "||" }
      \new Voice { \voiceTwo a,1 \bar "|" f1 \bar "|" d1 e1 \bar "|" a,\breve\fermata \bar "||" }
    >>
  >>
  \layout { ragged-right = ##f \context { \Score \remove "Bar_number_engraver" } }
}

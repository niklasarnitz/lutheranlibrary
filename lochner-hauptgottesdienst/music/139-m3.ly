\version "2.24.3"
% Scan 139, printed p. 114: Mecklenburg Cantional final Kyrie call and response.
#(set-global-staff-size 18)
\header { tagline = ##f }
\paper { paper-width = 135\mm left-margin = 4\mm right-margin = 0\mm top-margin = 0\mm bottom-margin = 0\mm indent = 0\mm print-page-number = ##f page-breaking = #ly:one-page-breaking }
\score {
  \new Staff <<
    \clef treble \omit Staff.TimeSignature \cadenzaOn
    \new Voice = "chant" { \voiceOne g'1^\markup \tiny "Liturg." g'1 b'1( c''1 d''1) c''1( b'1) c''1 d''\breve\fermata \bar "||" }
    \new Lyrics \lyricsto "chant" { \set ignoreMelismata = ##t Ky -- ri -- "e!" \skip 1 \skip 1 E -- lei -- \skip 1 "son!" }
  >>
  \layout { ragged-right = ##f \context { \Score \remove "Bar_number_engraver" } }
}
\score {
  \new PianoStaff <<
    \new Staff <<
      \clef treble \omit Staff.TimeSignature \cadenzaOn
      \new Voice { \voiceOne b'1^\markup \tiny "Respons." d''1 \bar "|" c''1 b'1 \bar "|" a'1 a'1 \bar "|" s2 g'\breve( \bar "|" g'\breve)\fermata \bar "||" }
      \new Voice = "responseLower" { \voiceTwo g'1 a'1 \bar "|" a'1 g'1 \bar "|" f'1 f'1( \bar "|" f'2) s2 e'2( d'1 \bar "|" d'\breve) \bar "||" }
    >>
    \new Lyrics \lyricsto "responseLower" { \set ignoreMelismata = ##t "HErr," er -- barm dich ü -- ber "uns!" \skip 1 \skip 1 \skip 1 }
    \new Staff <<
      \clef bass \omit Staff.TimeSignature \cadenzaOn
      \new Voice { \voiceOne d'1 f'1 \bar "|" e'1 c'1 \bar "|" b1 d'1 \bar "|" b2( s2 c'1\< b4\!\> a4 \bar "|" b\breve)\! \bar "||" }
      \new Voice { \voiceTwo g1 d1 \bar "|" a1 e1 \bar "|" f1 d1 \bar "|" g\breve( s2 \bar "|" g,\breve)\fermata \bar "||" }
    >>
  >>
  \layout { ragged-right = ##f \context { \Score \remove "Bar_number_engraver" } }
}

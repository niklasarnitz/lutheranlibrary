\version "2.24.3"
% Scan 138, printed page 113: Mecklenburg Cantional, Christe continuation.
#(set-global-staff-size 18)
\header { tagline = ##f }
\paper { paper-width = 120\mm left-margin = 4\mm right-margin = 0\mm top-margin = 0\mm bottom-margin = 0\mm indent = 0\mm print-page-number = ##f page-breaking = #ly:one-page-breaking }
\score {
  \new Staff <<
    \clef treble \omit Staff.TimeSignature \cadenzaOn
    \new Voice = "chant" { \voiceOne g'\breve^\markup \tiny "Liturg." a'1( b'1 c''1) b'1 a'\breve g'\breve \bar "||" }
    \new Lyrics \lyricsto "chant" { \set ignoreMelismata = ##t Chri -- "ste!" \skip 1 \skip 1 E -- lei -- "son!" }
  >>
  \layout { ragged-right = ##f \context { \Score \remove "Bar_number_engraver" } }
}
\score {
  \new PianoStaff <<
    \new Staff <<
      \clef treble \omit Staff.TimeSignature \cadenzaOn
      \new Voice = "response" { \voiceOne a'1^\markup \tiny "Respons." \bar "|" a'1 e'1 \bar "|" e'1 e'1 \bar "|" g'\breve\fermata \bar "||" }
      \new Voice { \voiceTwo c'1 \bar "|" c'1 b1 \bar "|" c'1 c'1 \bar "|" d'\breve \bar "||" }
    >>
    \new Lyrics \lyricsto "response" { Chri -- "ste," er -- bar -- me "dich!" }
    \new Staff <<
      \clef bass \omit Staff.TimeSignature \cadenzaOn
      \new Voice { \voiceOne e1 \bar "|" a1 g1 \bar "|" g1 a1 \bar "|" b\breve \bar "||" }
      \new Voice { \voiceTwo a,1 \bar "|" f,1 g,1 \bar "|" c1 g,1 \bar "|" g,\breve\fermata \bar "||" }
    >>
  >>
  \layout { ragged-right = ##f \context { \Score \remove "Bar_number_engraver" } }
}

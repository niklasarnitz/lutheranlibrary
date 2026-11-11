\version "2.24.3"
% Lochner, Liedförmiges Kyrie. PDF scan 142, printed p. 117.
#(set-global-staff-size 18)
\header { tagline = ##f }
\paper { paper-width = 170\mm left-margin = 4\mm right-margin = 0\mm top-margin = 0\mm bottom-margin = 0\mm indent = 0\mm print-page-number = ##f page-breaking = #ly:one-page-breaking }
\score {
  \new PianoStaff <<
    \new Staff <<
      \clef treble \omit Staff.TimeSignature \cadenzaOn
      \new Voice = "sung" { \voiceOne g'2 g'2 \bar "|" f'1 \bar "|" a'4 b'4 c''4 b'4 \bar "|" a'2 g'4 f'4 \bar "|" g'2 a'2^\markup { \bold "Gem." } \bar "|" a'2 g'2 \bar "||" }
      \new Voice { \voiceTwo d'2 e'2 c'1 f'4 f'4 g'4 g'4 f'2 e'4 d'4 e'2 e'2 fis'2 g'2 }
    >>
    \new Lyrics \lyricsto "sung" { \set ignoreMelismata = ##t Mensch ge -- "born," der du für uns trugst Got -- tes "Zorn," E -- lei -- "son!" }
    \new Staff <<
      \clef bass \omit Staff.TimeSignature \cadenzaOn
      \new Voice { \voiceOne b2 c'2 a1 c'4 d'4 e'4 e'4 c'2 c'4 a4 c'2 c'2 d'2 b2 }
      \new Voice { \voiceTwo g2 c2 f1 f4 d4 c4 e4 f2 c4 d4 c2 a,2 d2 g2 }
    >>
  >>
  \layout { ragged-right = ##f \context { \Score \autoBeamOff \remove "Bar_number_engraver" } }
}

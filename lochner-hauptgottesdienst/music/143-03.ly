\version "2.24.3"
% Lochner, Liedförmiges Kyrie. PDF scan 143, printed p. 118.
#(set-global-staff-size 18)
\header { tagline = ##f }
\paper { paper-width = 180\mm left-margin = 4\mm right-margin = 0\mm top-margin = 0\mm bottom-margin = 0\mm indent = 0\mm print-page-number = ##f page-breaking = #ly:one-page-breaking }
\score {
  \new PianoStaff <<
    \new Staff <<
      \clef treble \omit Staff.TimeSignature \cadenzaOn
      \new Voice = "sung" { \voiceOne d''4 d''4 d''4 d''4 \bar "|" c''2 b'2 \bar "|" a'2 b'4 c''4 \bar "|" d''2 c''2 \bar "|" b'2 a'4 b'4 \bar "|" b'2 g'4 c''4 }
      \new Voice { \voiceTwo fis'4 fis'4 g'4 g'4 e'4( fis'4 g'4) g'4 fis'!2 g'4 g'4 a'2. e'4 g'2 fis'!4 fis'4 g'2 e'4 e'4 }
    >>
    \new Lyrics \lyricsto "sung" { \set ignoreMelismata = ##t wir in sol -- chem Glau -- ben rein dich an -- be -- ten al -- lein und blei -- ben die }
    \new Staff <<
      \clef bass \omit Staff.TimeSignature \cadenzaOn
      \new Voice { \voiceOne a4 a4 b4 b4 c'2 d'2 d'2 d'4 e'4 f'!2( e'4) c'4 d'2 d'4 d'4 d'2 c'4 c'4 }
      \new Voice { \voiceTwo d4 d4 g4 g4 a2 g2 d2 g4 e4 d2 a2 g2 d4 b,4 g,2 c4 a,4 }
    >>
  >>
  \layout { ragged-right = ##f \context { \Score \autoBeamOff \remove "Bar_number_engraver" } }
}

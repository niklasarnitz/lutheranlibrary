\version "2.24.3"
% Lochner, Der apostolische Glaube. Source pages 173–174.
#(set-global-staff-size 16)
\header { tagline = ##f }
\paper {
  paper-width = 120\mm
  left-margin = 3\mm right-margin = 1\mm
  top-margin = 0\mm bottom-margin = 0\mm
  indent = 0\mm print-page-number = ##f
  page-breaking = #ly:one-page-breaking
}
global = { \key d \major \time 2/2 \accidentalStyle forget }

\score {
  \new PianoStaff <<
    \new Staff <<
      \clef treble \omit Staff.TimeSignature \global \cadenzaOn
      \new Voice = "soprano" { \voiceOne d''2 e''2 \bar "|" d''2 b'2 \bar "|" a'2 fis'2 \bar "|" a'4 a'4 fis'2 \bar "|" e'2 e'4 e'4 \bar "|" d'2\fermata r4 d'4 \bar "|" }
      \new Voice = "alto" { \voiceTwo fis'2 a'2 a'2 g'2 fis'2 d'2 d'4 e'4 d'2( d'4) b4 cis'4 cis'4 a2 s4 a4 }
    >>
    \new Lyrics \lyricsto "soprano" { \set ignoreMelismata = ##t Got -- "te," Licht vom Lich -- "te," wah -- rer Gott vom wah -- ren "Gott," "ge-" }
    \new Staff <<
      \clef bass \omit Staff.TimeSignature \global \cadenzaOn
      \new Voice { \voiceOne a2 cis'2 d'2 d'2 d'2 a2 a4 a4 a2 a2 a4 a4 fis2 r4 fis4 }
      \new Voice = "bass" { \voiceTwo d2 a2 fis2 g2 d2 d2 fis4 cis4 d2 a,2 a,4 a,4 d2\fermata s4 d4 }
    >>
  >>
  \layout {
    ragged-right = ##f
    \context { \Score \autoBeamOff \remove "Bar_number_engraver" }
    \context { \Lyrics \override LyricText.font-size = #-2 }
  }
}

\version "2.24.3"
% Lochner, Das Nicänische Bekenntniß. Printed page 181.
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
      \new Voice = "soprano" { \voiceOne fis'4 fis'4 d'4 d'4 \bar "|" fis'2( gis'2) \bar "|" a'1 \bar "|" d''4 d''4 cis''4 cis''4 \bar "|" b'2 a'2 \bar "|" a'2 a'2 \bar "|" fis'2( e'2) \bar "|" d'1\fermata \bar "|."  \bar "|" }
      \new Voice = "alto" { \voiceTwo d'4 a4 b4 b4 d'1 cis'1 fis'4 fis'4 fis'4 fis'4 d'2 d'2 cis'2 e'2 d'2.( cis'4) a1 }
    >>
    \new Lyrics \lyricsto "soprano" { \set ignoreMelismata = ##t di -- gen und die Tod \skip 1 "ten," so daß sei -- nes Reichs kein En -- de sein \skip 1 "wird." }
    \new Staff <<
      \clef bass \omit Staff.TimeSignature \global \cadenzaOn
      \new Voice { \voiceOne a4 fis4 fis4 g4 a2( d2) e1 b4 b4 a4 a4 g2 fis2 e2 a2 a1 fis1 }
      \new Voice = "bass" { \voiceTwo d4 d4 b,4 g,4 d2( b,2) a,1 b,4 d4 fis4 fis,4 g,2 d2 a,2 cis2 d2( a,2) d1\fermata }
    >>
  >>
  \layout {
    ragged-right = ##f
    \context { \Score \autoBeamOff \remove "Bar_number_engraver" }
    \context { \Lyrics \override LyricText.font-size = #-2 }
  }
}

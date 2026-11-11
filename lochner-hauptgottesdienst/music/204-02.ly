\version "2.24.3"
% Lochner, Das Nicänische Bekenntniß. Printed page 179.
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
      \new Voice = "soprano" { \voiceOne b'4 b'4 fis'2 \bar "|" g'2.( e'4) \bar "|" fis'4 g'4 a'2 \bar "|" a'4 a'4 fis'4 fis'4 \bar "|" e'2 d'2\fermata \bar "|" a'2( b'2) \bar "|" }
      \new Voice = "alto" { \voiceTwo d'4 e'4 cis'2 e'4.( d'8 cis'2) d'4 d'4 cis'2 d'4 e'4 d'4 d'4( d'4) cis'4 a2 d'1 }
    >>
    \new Lyrics \lyricsto "soprano" { \set ignoreMelismata = ##t Se -- lig -- keit wil \skip 1 len vom Him -- mel her -- ab -- ge -- stie -- "gen," und \skip 1 }
    \new Staff <<
      \clef bass \omit Staff.TimeSignature \global \cadenzaOn
      \new Voice { \voiceOne g4 b4 gis2 b2( g2) a4 b4 fis2 fis4 a4 a4 a4 a2 fis2 fis2( g2) }
      \new Voice = "bass" { \voiceTwo g,4 g4 e2 fis1 d4 b,4 a,2 d4 cis4 d4 fis,4 a,2 d2\fermata d2( g2) }
    >>
  >>
  \layout {
    ragged-right = ##f
    \context { \Score \autoBeamOff \remove "Bar_number_engraver" }
    \context { \Lyrics \override LyricText.font-size = #-2 }
  }
}

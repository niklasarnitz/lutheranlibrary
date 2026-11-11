\version "2.24.3"
% Lochner, Das Nicänische Bekenntniß. Printed pages 182–183.
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
      \new Voice = "soprano" { \voiceOne b'2 b'4 b'4 \bar "|" a'2 a'2( \bar "|" fis'2) e'4 e'4 \bar "|" d'1 \bar "|" fis'2( a'2 \bar "|" fis'2 d'2 \bar "|" e'1) \bar "|" d'1\fermata \bar "|." }
      \new Voice = "alto" { \voiceTwo d'2 d'4 d'4 cis'2 e'2( d'2) d'4( cis'4) a1 d'2( cis'2 d'2. s4 d'2 cis'2) a1 }
    >>
    \new Lyrics \lyricsto "soprano" { \set ignoreMelismata = ##t Le -- ben der zu -- künf \skip 1 ti -- gen Welt. A \skip 1 \skip 1 \skip 1 \skip 1 "men." }
    \new Staff <<
      \clef bass \omit Staff.TimeSignature \global \cadenzaOn
      \new Voice { \voiceOne fis2 g4 g4 e2 a2( a2) a4 a4 fis1 a1( a2 fis2 a4 g8[ fis8] e2) fis1 }
      \new Voice = "bass" { \voiceTwo b,2 g,4 g,4 a,2 cis2( d2) a,4 a,4 d1 d2( fis2 d1 a,1) d1\fermata }
    >>
  >>
  \layout {
    ragged-right = ##f
    \context { \Score \autoBeamOff \remove "Bar_number_engraver" }
    \context { \Lyrics \override LyricText.font-size = #-2 }
  }
}

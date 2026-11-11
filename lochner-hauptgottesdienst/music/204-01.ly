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
      \new Voice = "soprano" { \voiceOne a'4 a'4 fis'4 fis'4 \bar "|" e'1 \bar "|" d'1\fermata \bar "|" r2 fis'2 \bar "|" e'4( fis'4) a'2 \bar "|" fis'4( e'4) d'2 \bar "|" a'4 a'4 g'4 a'4 \bar "|" }
      \new Voice = "alto" { \voiceTwo e'4 e'4 d'4 d'4 d'2.( cis'4) a1 s2 d'2 b4( d'4) e'2 d'4( cis'4) a2 cis'4 d'4 b4 d'4 }
    >>
    \new Lyrics \lyricsto "soprano" { \set ignoreMelismata = ##t al -- le Ding ge -- macht "sind," der um \skip 1 uns Men \skip 1 schen und um uns -- rer }
    \new Staff <<
      \clef bass \omit Staff.TimeSignature \global \cadenzaOn
      \new Voice { \voiceOne cis'4 a4 a4 a4 b2( a2) fis1 r2 a2 g4( a4) a2 a2 fis2 e4 fis4 g4 fis4 }
      \new Voice = "bass" { \voiceTwo a,4 cis4 d4 d4 g,2( a,2) d1\fermata s2 d2 e4( d4) cis2 d4( a,4) d2 a,4 d4 e4 d4 }
    >>
  >>
  \layout {
    ragged-right = ##f
    \context { \Score \autoBeamOff \remove "Bar_number_engraver" }
    \context { \Lyrics \override LyricText.font-size = #-2 }
  }
}

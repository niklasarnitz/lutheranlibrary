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
      \new Voice = "soprano" { \voiceOne a'2( g'2) \bar "|" fis'1 \bar "|" e'2 fis'2 \bar "|" a'2( fis'4) fis'4 \bar "|" e'1 \bar "|" d'1\fermata \bar "|" fis'2 a'2 \bar "|" fis'2 d'4 d'4 \bar "|" }
      \new Voice = "alto" { \voiceTwo fis'2( e'4 d'8[ cis'8]) d'1 cis'2 d'2 e'2( d'4) d'4 d'2( cis'2) a1 d'2 e'2 d'2 a4 b4 }
    >>
    \new Lyrics \lyricsto "soprano" { \set ignoreMelismata = ##t Jung \skip 1 "frau," und ist Mensch \skip 1 ge -- wor -- "den," auch ge -- kreu -- zigt für }
    \new Staff <<
      \clef bass \omit Staff.TimeSignature \global \cadenzaOn
      \new Voice { \voiceOne d'2( b4 g4) a1 a2 a2 a2. d4 e4( fis8[ g8] a2) fis1 a2 a2 a2 fis4 g4 }
      \new Voice = "bass" { \voiceTwo d2( e2) d1 a,2 d2 cis2( d4) fis,4 a,1 d1\fermata d2 cis2 d2 d4 g4 }
    >>
  >>
  \layout {
    ragged-right = ##f
    \context { \Score \autoBeamOff \remove "Bar_number_engraver" }
    \context { \Lyrics \override LyricText.font-size = #-2 }
  }
}

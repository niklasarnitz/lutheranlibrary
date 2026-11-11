\version "2.24.3"
% Lochner, Das Nicänische Bekenntniß. Printed pages 182–183.
% The last bass pair on “das” is obscured by the edge blot; both notes are left open.
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
      \new Voice = "soprano" { \voiceOne fis'2 a'2 \bar "|" fis'2 d'4 d'4 \bar "|" d'2 a'2 \bar "|" b'2 a'4 a'4 \bar "|" fis'2( gis'2) \bar "|" a'1\fermata \bar "|" a'2 a'4 \bar "|" }
      \new Voice = "alto" { \voiceTwo d'2 e'2 d'2 b4 b4 a2 cis'2 d'2 d'4 cis'4 d'2( e'2) cis'1 d'2 e'4 }
    >>
    \new Lyrics \lyricsto "soprano" { \set ignoreMelismata = ##t und war -- te auf die Auf -- er -- ste -- hung der Tod \skip 1 "ten," und das }
    \new Staff <<
      \clef bass \omit Staff.TimeSignature \global \cadenzaOn
      \new Voice { \voiceOne a2 a2 a2 g4 g4 fis2 e2 g2 fis4 a4 b1 a1 fis2 s4 }
      \new Voice = "bass" { \voiceTwo d2 cis2 d2 g,4 g,4 d2 a,2 g,2 d4 fis4 b,2( e2) a,1\fermata d2 s4 }
    >>
  >>
  \layout {
    ragged-right = ##f
    \context { \Score \autoBeamOff \remove "Bar_number_engraver" }
    \context { \Lyrics \override LyricText.font-size = #-2 }
  }
}

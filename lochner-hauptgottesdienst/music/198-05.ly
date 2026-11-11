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
      \clef treble \global \cadenzaOn
      \new Voice = "soprano" { \voiceOne a'2 fis'4 g'4 \bar "|" a'1 \bar "|" b'2 a'2 \bar "|" fis'4 g'4 e'4 e'4 \bar "|" d'1\fermata \bar "|" fis'4( g'4) a'2 \bar "|" }
      \new Voice = "alto" { \voiceTwo fis'2 d'4 d'4 d'1 d'2 d'2 d'4 d'4 d'4 cis'4 d'1 d'2 d'2 }
    >>
    \new Lyrics \lyricsto "soprano" { \set ignoreMelismata = ##t Ich glaub an Gott Va -- ter den All -- mäch -- ti -- "gen," Schö \skip 1 pfer }
    \new Staff <<
      \clef bass \global \cadenzaOn
      \new Voice { \voiceOne d'2 a4 b4 a1 g2 fis2 a4 b4 a4 a4 fis1 b2 a2 }
      \new Voice = "bass" { \voiceTwo d2 d4 g4 fis1 g2 d2 d4 g,4 a,4 a,4 b,1\fermata b4( g4) fis2 }
    >>
  >>
  \layout {
    ragged-right = ##f
    \context { \Score \autoBeamOff \remove "Bar_number_engraver" }
    \context { \Lyrics \override LyricText.font-size = #-2 }
  }
}

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
      \new Voice = "soprano" { \voiceOne a'4 g'4 fis'2 \bar "|" e'1 \bar "|" a'2 a'2 \bar "|" fis'4 e'4 d'2 \bar "|" e'2 fis'2 \bar "|" g'4( fis'4 e'2) \bar "|" d'1 \bar "|." }
      \new Voice = "alto" { \voiceTwo d'4 d'4 d'2 cis'1 e'2 e'2 d'4 cis'4 b2 cis'2 d'2 d'2.( cis'4) d'1 }
    >>
    \new Lyrics \lyricsto "soprano" { \set ignoreMelismata = ##t hung des Flei -- sches und ein e -- wi -- ges Le -- "ben." A \skip 1 \skip 1 "men." }
    \new Staff <<
      \clef bass \omit Staff.TimeSignature \global \cadenzaOn
      \new Voice { \voiceOne a4 b4 a2 a1 cis'2 cis'2 a4 a4 fis2 a2 a2 b4( a4 a2) fis1 }
      \new Voice = "bass" { \voiceTwo fis4 g4 d2 a,1 a,2 a,2 d4 a,4 b,2 a,2 d2 g4( d4 a,2) d1 }
    >>
  >>
  \layout {
    ragged-right = ##f
    \context { \Score \autoBeamOff \remove "Bar_number_engraver" }
    \context { \Lyrics \override LyricText.font-size = #-2 }
  }
}

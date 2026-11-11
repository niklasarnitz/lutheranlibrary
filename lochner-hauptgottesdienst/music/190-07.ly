\version "2.24.3"
% Scan 190, printed p. 165: alternative congregational Ehre sei dir, HErre.
#(set-global-staff-size 17)
\header { tagline = ##f }
\paper { paper-width = 100\mm top-margin = 0\mm bottom-margin = 0\mm left-margin = 3\mm right-margin = 0\mm indent = 0\mm print-page-number = ##f page-breaking = #ly:one-page-breaking }
\score {
 <<
  \new PianoStaff <<
   \new Staff <<
    \new Voice = "soprano" { \voiceOne \clef treble \key g \major \cadenzaOn
      b'2 b'2 b'2 \bar "|" a'2 a'1( g'1) \bar "|." }
    \new Voice { \voiceTwo \cadenzaOn
      d'2 d'2 d'2 d'2 d'1( b1) }
   >>
   \new Staff <<
    \new Voice { \voiceOne \clef bass \key g \major \cadenzaOn
      g2 g2 g2 \bar "|" fis2 fis1( d1) \bar "|." }
    \new Voice { \voiceTwo \cadenzaOn
      g,2 g,2 g,2 d2 d1( g,1) }
   >>
  >>
  \new Lyrics \lyricsto "soprano" { \set ignoreMelismata = ##t Eh -- re sei dir, HErr -- re. }
    \new Lyrics \lyricsto "soprano" { \set ignoreMelismata = ##t \repeat unfold 4 { \skip 1 } "(HErr.)" }
 >>
 \layout { ragged-right = ##f \context { \Lyrics \override LyricText.font-size = #-3 } \context { \Score \remove "Bar_number_engraver" } \context { \Staff \remove "Time_signature_engraver" } }
}

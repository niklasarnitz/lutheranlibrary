\version "2.24.3"
% Lochner, printed 228, Offertorium, original system 4 and close.
#(set-global-staff-size 16)
\header { tagline = ##f }
\paper { paper-width = 100\mm top-margin = 1\mm bottom-margin = 1\mm left-margin = 3\mm right-margin = 1\mm indent = 0\mm print-page-number = ##f page-breaking = #ly:one-page-breaking }
\score {
 <<
  \new PianoStaff <<
   \new Staff <<
    \new Voice = "soprano" { \voiceOne \clef treble \key d \major \time 4/4
      r2 fis'2 \bar "|" g'4 b'4 a'2 \bar "|" g'4 fis'4 e'2 \bar "|" g'4 b'4 fis'2( \bar "|" \break e'4 d'4) e'2 \bar "|" \once \override NoteColumn.force-hshift = #-0.6 d'1^\fermata \bar "|." }
    \new Voice = "alto" { \voiceTwo \time 4/4
      s2 d'2 d'4 d'4 d'2 d'4 d'4 cis'2 d'4 e'4 d'2( cis'4 d'2) cis'4 \once \override NoteColumn.force-hshift = #0.6 d'1 }
   >>
  \new Lyrics \lyricsto "soprano" { \set ignoreMelismata = ##t Dann wird man "Far :" ren auf "dei :" nem "Al :" tar \skip 1 \skip 1 "o : :" "pfern." }
   \new Staff <<
    \new Voice = "tenor" { \voiceOne \clef bass \key d \major \time 4/4
      r2 a2 \bar "|" b4 g4 a2 \bar "|" b4 a4 a2 \bar "|" g4 fis4 a2( \bar "|" a4 fis4) a2 \bar "|" fis1 \bar "|." }
    \new Voice = "bass" { \voiceTwo \time 4/4
      s2 d2 g4 g4 fis2 g4 d4 a,2 b,4 cis4 d2( a,4 b,4) a,2 d1 }
   >>
  >>
  \new Lyrics \lyricsto "bass" { \set ignoreMelismata = ##t \repeat unfold 10 { \skip 1 } "o : : : : :" \skip 1 \skip 1 "pfern." }
 >>
 \layout { ragged-right = ##f \context { \Lyrics \override LyricText.font-size = #-2 } \context { \Score \remove "Bar_number_engraver" } \context { \Staff \remove "Time_signature_engraver" } }
}

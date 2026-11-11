\version "2.24.3"
% Lochner, I. Sanctus. Source pages 218–219.
#(set-global-staff-size 16)
\header { tagline = ##f }
\paper {
  paper-width = 120\mm
  left-margin = 3\mm right-margin = 1\mm
  top-margin = 0\mm bottom-margin = 0\mm
  indent = 0\mm print-page-number = ##f
  page-breaking = #ly:one-page-breaking
}
global = { \key f \major \time 4/4 \accidentalStyle forget }

\score {
  \new PianoStaff <<
    \new Staff <<
      \clef treble \omit Staff.TimeSignature \global \cadenzaOn
      \new Voice = "soprano" { \voiceOne a'4( bes'4 c''2) \bar "|" c''4( bes'4 a'4 g'4) \bar "|" a'2 g'4( a'4) \bar "|" f'2( g'2) \bar "|" f'1\fermata \bar "|" f'2 a'4( g'4) \bar "|" g'4( c''4) c''2 \bar "|" }
      \new Voice = "alto" { \voiceTwo f'1 f'4( d'4 f'4 e'4) f'2 e'2 f'2.( e'4) f'1 c'2 f'4( e'4) e'2 e'2 }
    >>
    \new Lyrics \lyricsto "soprano" { \set ignoreMelismata = ##t an \skip 1 \skip 1 na \skip 1 \skip 1 \skip 1 in der \skip 1 Hö \skip 1 "he!" Ge -- be \skip 1 ne \skip 1 deit }
    \new Staff <<
      \clef bass \omit Staff.TimeSignature \global \cadenzaOn
      \new Voice { \voiceOne c'4( bes4 a2) a4( bes4 c'4 c'4) c'2 c'2 a2( c'2) a1 a2 c'2 c'2 c'2 }
      \new Voice = "bass" { \voiceTwo f1 f4( g4 a4 c'4) f2 c4( a,4) d2( c2) f1\fermata f2 f4( c4) c'4( a4) a2 }
    >>
  >>
  \layout {
    ragged-right = ##f
    \context { \Score \autoBeamOff \remove "Bar_number_engraver" }
    \context { \Lyrics \override LyricText.font-size = #-2 }
  }
}

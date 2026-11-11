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
      \new Voice = "soprano" { \voiceOne c''2 d''4( c''4) \bar "|" a'4( bes'4 c''2) \bar "|" c''4( bes'4 a'4 g'4) \bar "|" a'2 g'4( a'4) \bar "|" f'2( g'2) \bar "|" f'1\fermata \bar "|." }
      \new Voice = "alto" { \voiceTwo e'2 f'4( g'4) f'1 f'4( d'4 f'4 e'4) f'2 e'2 f'2.( e'4) f'1 }
    >>
    \new Lyrics \lyricsto "soprano" { \set ignoreMelismata = ##t Ho -- si \skip 1 an \skip 1 \skip 1 na \skip 1 \skip 1 \skip 1 in der \skip 1 Hö \skip 1 "he." }
    \new Staff <<
      \clef bass \omit Staff.TimeSignature \global \cadenzaOn
      \new Voice { \voiceOne a2 a4( g4) c'4( bes4 a2) a4( bes4 c'4 c'4) c'2 c'2 a2( c'2) a1 }
      \new Voice = "bass" { \voiceTwo a,2 d4( e4) f1 f4( g4 a4 c'4) f2 c4( a,4) d2( c2) f,1\fermata }
    >>
  >>
  \layout {
    ragged-right = ##f
    \context { \Score \autoBeamOff \remove "Bar_number_engraver" }
    \context { \Lyrics \override LyricText.font-size = #-2 }
  }
}

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
      \new Voice = "soprano" { \voiceOne a'2 g'4( a'4) \bar "|" f'2( g'2) \bar "|" f'2 f'2( \bar "|" a'4 g'4) g'4( c''4) \bar "|" c''2( d''2) \bar "|" c''1\fermata \bar "|" c''2 d''4( c''4) \bar "|" }
      \new Voice = "alto" { \voiceTwo f'2 e'2 f'2.( e'4) f'2 c'2( f'4 e'4) e'4( g'4) e'2( g'2) e'1 e'2 f'4( g'4) }
    >>
    \new Lyrics \lyricsto "soprano" { \set ignoreMelismata = ##t mel und \skip 1 Erd \skip 1 reich dei \skip 1 \skip 1 ner \skip 1 Eh \skip 1 "ren." Ho -- si \skip 1 }
    \new Staff <<
      \clef bass \omit Staff.TimeSignature \global \cadenzaOn
      \new Voice { \voiceOne c'2 c'2 a2( c'2) a2 a2( c'2) c'2 c'2.( b!4) g1 a2 a4( g4) }
      \new Voice = "bass" { \voiceTwo f2 c4( a,4) d2( c2) f2 f2( f4 c4) c4( e4) a2( g2) c1\fermata a,2 d4( e4) }
    >>
  >>
  \layout {
    ragged-right = ##f
    \context { \Score \autoBeamOff \remove "Bar_number_engraver" }
    \context { \Lyrics \override LyricText.font-size = #-2 }
  }
}

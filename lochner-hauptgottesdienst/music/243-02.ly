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
      \new Voice = "soprano" { \voiceOne a'2( c''2) \bar "|" d''2( c''2) \bar "|" c''2 b'!2 \bar "|" d''2( c''2) \bar "|" c''2( bes'2) \bar "|" a'4( bes'4 c''2) \bar "|" c''4( bes'4 a'4 g'4) \bar "|" }
      \new Voice = "alto" { \voiceTwo f'2( g'2) f'2( e'2) f'2 d'2 f'2( e'2) g'2( f'2) f'1 f'4( d'4 f'4 e'4) }
    >>
    \new Lyrics \lyricsto "soprano" { \set ignoreMelismata = ##t der \skip 1 HErr \skip 1 Ze -- ba -- "oth." \skip 1 Voll \skip 1 sind \skip 1 \skip 1 Him \skip 1 \skip 1 \skip 1 }
    \new Staff <<
      \clef bass \omit Staff.TimeSignature \global \cadenzaOn
      \new Voice { \voiceOne a2( g2) a1 a2 g2 b!2( c'2) e'2( d'2) c'4( bes4 a2) a4( bes4 c'4 c'4) }
      \new Voice = "bass" { \voiceTwo f2( e2) d2( a2) f2 g2 g2( c2) c2( d2) f1 f4( g4 a4 c'4) }
    >>
  >>
  \layout {
    ragged-right = ##f
    \context { \Score \autoBeamOff \remove "Bar_number_engraver" }
    \context { \Lyrics \override LyricText.font-size = #-2 }
  }
}
